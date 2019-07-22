const process = require('process');
const gulp = require('gulp');
const changed = require('gulp-changed');
const plumber = require('gulp-plumber');
const coffee = require('gulp-coffeescript');

const isDevelopmen = process.env.NODE_ENV === 'development';

const file = {
  src: 'src/**/*.coffee',
  lib: 'lib'
};

/* 开发 */
function coffeeProject() {
  return gulp.src(file.src)
    .pipe(changed(file.lib))
    .pipe(plumber())
    .pipe(coffee())
    .pipe(gulp.dest(file.lib));
}

/* 监听文件 */
function watchProject() {
  gulp.watch(file.src, coffeeProject);
}

/* 编译 */
function buildCoffeeProject() {
  return gulp.src(file.src)
    .pipe(coffee())
    .pipe(gulp.dest(file.lib));
}

exports.default = isDevelopmen ? gulp.series(coffeeProject, watchProject) : buildCoffeeProject;