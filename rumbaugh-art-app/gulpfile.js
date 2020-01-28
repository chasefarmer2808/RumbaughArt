const { src, dest, parallel } = require('gulp');
const replace = require('gulp-replace');

function copyBuildJS() {
    return src('dist/rumbaugh-art-app/*.js')
        .pipe(dest('../server/static'));
}

function copyBuildHTML() {
    return src('dist/rumbaugh-art-app/index.html')
        .pipe(replace('type="module"', 'type="text/javascript"'))
        .pipe(replace('src="', 'src="static/'))
        .pipe(dest('../server/templates'));
}

function copyFavicon() {
    return src('dist/rumbaugh-art-app/favicon.ico')
        .pipe(dest('../server/static'));
}

exports.copyBuild = parallel(copyBuildJS, copyBuildHTML, copyFavicon);