##更换源
1.  
sudo pacman-mirrors -i -c China -m rank  
sudo pacman -Syy  
2.  
在/etc/pacman.conf的最后一行添加：  
[archlinuxcn]  
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
3.  
sudo pacman -Syy  
sudo pacman -S archlinuxcn-keyring

##输入法
sudo pacman -S fcitx-im fcitx-configtool manjaro-asian-input-support-fcitx  
sudo pacman -S fcitx-cloudpinyin

##manjaro xfce版 命令行字体间隙太大解决
sudo pacman -S wqy-bitmapfont  
sudo pacman -S wqy-zenhei
