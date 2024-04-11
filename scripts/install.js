import {
    readdirSync,
    statSync,
    copyFileSync,
    mkdirSync,
    existsSync,
} from "node:fs";
import path from "path";
import { parse } from "yaml";

class Installer {
    static tmpFile = "./stdpath.tmp.txt";

    static fromDir = "./config-dir/";

    static variablesFile = "./variables/";

    static start(toDir) {
        const file = fs.readFileSync(this.variablesFile, "utf8");
        const vars = parse(file);

        this.findConfigDir();
        const allFiles = this.getFilesRecursive(this.fromDir, []);

        allFiles.forEach((file) => {
            const oldFile = path.join(this.fromDir, file);
            const newFile = path.join(toDir, file);

            const template = file.match(/^(.*)\.tpl$/);

            if (template !== null) {
                this.templateToFile(oldFile, newFile, vars);
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
}

Installer.start(process.argv[2]);
