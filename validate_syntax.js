const fs = require('fs');
const path = require('path');
const luaparse = require('luaparse');

const directories = ['src/server', 'src/shared', 'src/client'];

function walkDir(dir, callback) {
    fs.readdirSync(dir).forEach(f => {
        let dirPath = path.join(dir, f);
        let isDirectory = fs.statSync(dirPath).isDirectory();
        isDirectory ? walkDir(dirPath, callback) : callback(path.join(dir, f));
    });
}

let hasError = false;

directories.forEach(dir => {
    if (!fs.existsSync(dir)) return;
    walkDir(dir, (filePath) => {
        if (filePath.endsWith('.lua')) {
            const content = fs.readFileSync(filePath, 'utf8');
            try {
                luaparse.parse(content);
                console.log(`✅ ${filePath} is syntactically correct.`);
            } catch (err) {
                console.error(`❌ Error in ${filePath}: ${err.message}`);
                hasError = true;
            }
        }
    });
});

if (hasError) {
    process.exit(1);
}
