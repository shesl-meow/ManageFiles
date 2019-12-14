# README

## `ManagePhotos.sh`

辣鸡蛇因为总是折腾操作系统、或者换手机什么的，所以经常需要备份照片、图片、文件什么的。最近打算把所有图片整理一下传到 icloud 上去，于是写了一个小脚本整理一下历史的照片。

因为一些奇怪的操作，导致经常发生：

1. 同样一个照片被备份了多次，并且变成了不同的文件名；
2. 不同手机、不同版本的操作系统生产出来的照片命名不统一；

脚本使用方式：

```bash
git clone https://github.com/shesl-meow/ManageFiles.git && cd ManageFiles

chmod +x ./ManagePhotos.sh

./ManagePhotos.sh md5sum ~/Documents/CameraSource ~/Documents/CameraSource.cp
```

上面这种使用方式，会将 `~/Documents/CameraSource` 下所有 0 级目录的文件，拷贝到 `~/Documents/CameraSource.cp` 下，并且重命名为 `日期-md5` 的方式。