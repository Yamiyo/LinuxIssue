# intro
假設有一台vm名稱叫做ubuntu

- 使用virtualbox的內建指令，直接運行vm
> VBoxManage startvm ubuntu --type headless

- 使用virtualbox的內建指令獲取正在運行中的vm
> VBoxManage list runningvms

- 使用virtualbox的內建指令獲取正在運行中的vm資訊
> VBoxManage showvminfo ubuntu

<!-- - 使用virtualbox的內建指令獲取該vm的ip
> VBoxManage guestproperty enumerate ubuntu -->

- 使用virtualbox的內建指令關閉正在運行中的vm
> VBoxManage controlvm ubuntu poweroff


# refer:
- https://superuser.com/questions/135498/run-virtualbox-in-background-without-a-window
- https://serverfault.com/questions/128685/how-can-i-get-the-bridged-ip-address-of-a-virtualbox-vm-running-in-headless-mode


# extend-refer:
在mac上安裝virtualbox
