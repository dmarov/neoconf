import { readdirSync, statSync, copyFileSync, mkdirSync, existsSync } from "fs";
import path from "path";

class Installer {
    static fromDir = "./config-dir/";

    static toDir = "C:/Users/mds/AppData/local/nvim/";

    static start() {
        const allFiles = this.getFilesRecursive(this.fromDir, []);

        allFiles.forEach((file) => {
            if (file.match(/^(.*)\.tpl$/)) {
                // create from template
            } else {
                const oldFile = path.join(this.fromDir, file);
                const newFile = path.join(this.toDir, file);
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
}

Installer.start();
