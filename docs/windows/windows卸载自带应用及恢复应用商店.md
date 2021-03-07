

* 卸载所有自带应用
    管理权限打开powershell 

    ```
    Get-AppxPackage -AllUsers | Remove-AppxPackage
    ```
    
* 恢复删除的应用(eg:windows应用商店)
    1. 先进这个链接[http://go.microsoft.com/fwlink/?LinkId=619547](http://go.microsoft.com/fwlink/?LinkId=619547)  下载一个记事本文件
    
    2. 管理员身份打开PowerShell 
    
       ```
       Set-ExecutionPolicy Unrestricted
       ```
    
       选择Y
    
    3. 进入下载的文件的文件夹执行: 
    
       ```
       .\reinstall-preinstalledApps.ps1 *Microsoft.WindowsStore
       
        --- 恢复成功 ----
       ```
    
       ​    
