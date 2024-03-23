import { readdirSync, statSync } from 'fs';

const fromDir = './config-dir/';

const toDir = 'C:/Users/mds/AppData/local/nvim/';

const getFilesRecursive = (dir, filelist) => {
  const files = readdirSync(dir);

  files.forEach((file) => {
    if (statSync(`${dir}${file}`).isDirectory()) {
      filelist = getFilesRecursive(`${dir}${file}/`, filelist);
    } else {
      filelist.push(`${dir}${file}`);
    }
  });

  return filelist;
};

const res = getFilesRecursive(fromDir, []);

console.log(res);
