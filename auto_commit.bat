@echo off
hexo clean&&hexo g&&hexo d&&git add .&&git commit -m "update"&&git push origin source&&pause