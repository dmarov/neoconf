import {
    readdirSync,
    statSync,
    copyFileSync,
    mkdirSync,
    existsSync,
    rmSync,
    readFileSync,
} from "node:fs";
import path from "path";
import { attach, findNvim } from "neovim";
import * as child_process from "node:child_process";

class Installer {
    static tmpFile = "./stdpath.tmp.txt";

    static fromDir = "./config-dir/";

    static toDir = "C:/Users/mds/AppData/local/nvim/";

    static start() {
        this.findConfigDir();
        return;
        const allFiles = this.getFilesRecursive(this.fromDir, []);

        allFiles.forEach((file) => {
            const oldFile = path.join(this.fromDir, file);
            const newFile = path.join(this.toDir, file);
            console.log(newFile);
            return;

            const template = file.match(/^(.*)\.tpl$/);

            if (template !== null) {
                // create from template
            } else {
                this.ensureDirectoryExists(newFile);
                copyFileSync(oldFile, newFile);
            }
        });
    }

    static getFilesRecursive(dir, filelist) {
        const files = readdirSync(dir);

        files.forEach((file) => {
            if (statSync(`${dir}${file}`).isDirectory()) {
                filelist = this.getFilesRecursive(`${dir}${file}/`, filelist);
            } else {
                const f = `${dir}${file}`;

                const r = path.relative(this.fromDir, f);
                filelist.push(r);
            }
        });

        return filelist;
    }

    static templateToFile(src, dist, vars) {
        const templateContent = fs.readFileSync(src, "utf-8");
        const template = handlebars.compile(templateContent);
        const res = template(vars);

        fs.writeFileSync(dist, res);
    }

    static ensureDirectoryExists(filePath) {
        const dirname = path.dirname(filePath);

        if (existsSync(dirname)) {
            return true;
        }

        ensureDirectoryExists(dirname);
        mkdirSync(dirname);
    }

    async execute(cmd, cwd, params = []) {
        return new Promise((res, rej) => {
            const proc = spawn(cmd, params, {
                cwd,
                shell: true,
            });

            proc.stderr.setEncoding("utf-8");
            proc.stdout.pipe(process.stdout);
            proc.stderr.pipe(process.stderr);

            proc.on("close", (code) => {
                code == 0 ? res() : rej();
            });
        });
    }

    static async findConfigDir() {
        const found = findNvim();
        const nvim_proc = child_process.spawn(
            found.matches[0].path,
            ["--clean", "--embed"],
            {},
        );

        const nvim = attach({ proc: nvim_proc });

        if (existsSync(this.tmpFile)) {
            rmSync(this.tmpFile);
        }

        nvim.command(`redir > ${this.tmpFile} | echo stdpath('config')`);

        if (nvim_proc.disconnect) {
            nvim_proc.disconnect();
        }

        nvim.quit();
        while (nvim_proc.exitCode === null) {
            await new Promise((resolve) => setTimeout(resolve, 100));
            console.log("waiting for Nvim (pid %d) to exit", nvim_proc.pid);
        }
        setTimeout(() => {
            const content = readFileSync(this.tmpFile, "utf-8");
            console.log(content);
        }, 1000);
    }
}

Installer.start();
