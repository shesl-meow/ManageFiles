# README

## `ManagePhotos.sh`

辣鸡蛇因为总是折腾操作系统（我竟然折腾出了 Windows、Ubuntu、Manjaro、Black-Apple 四系统，真佩服自己）、或者换手机什么的，所以经常需要备份照片、图片、文件什么的。

最近打算把所有图片整理一下，传到 icloud 上去，于是写了一个小脚本，用于简单地整理一下历史的照片的命名（有空看看 CV 的方式）。

之前因为一些奇怪的操作，导致经常发生：

1. 同样一个照片被备份了多次，并且变成了不同的文件名；
2. 不同手机、不同版本的操作系统生产出来的照片命名不统一； 
3. 原生相机生产的照片和软件保存的图片混合到一起；

解决方案是：

1. 通过文件的哈希值是否相等，判断两个文件是否相等；
2. 定义一个日期与哈希值组合的命名规范，同名自动覆盖；

针对这个解决方案，写了一个脚本在 github 上（见阅读原文）。脚本使用方式： 

```bash
git clone https://github.com/shesl-meow/ManageFiles.git && cd ManageFiles
# 下载项目

chmod +x ./ManagePhotos.sh
# 给脚本可执行权限

./ManagePhotos.sh md5sum ~/Documents/CameraSource ~/Documents/CameraSource.cp
# 将 ~/Documents/CameraSource 下所有的文件，拷贝到 ~/Documents/CameraSource.cp 下，并且重命名为 `日期-文件md5.原始后缀` 的方式。
```

github 链接：https://github.com/shesl-meow/ManageFiles