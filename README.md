# Usage
1. install docker https://docs.docker.com/engine/install/ubuntu/ or https://docs.docker.com/docker-for-windows/install/
   or Ubuntu2204 on windows app store and install docker on wsl2
2. git clone this repo
3. download windows iso into `/iso` folder
4. create image into `/img` folder
   ```shell
   > cd img
   > qemu-img create -f vhdx -o size=20G win7.vhdx
   ```
   [qemu-img for windows](https://cloudbase.it/qemu-img-windows/)
5. replace `win7.vhdx` in `docker-compose.yml` with your image name
   ```
   "-drive", "file=/img/win7.vhdx", 
   ```
   replace `cn_windows_7_ultimate_with_sp1_x64_dvd_u_677408.iso` in `docker-compose.yml` with your iso name
   ```
    "-cdrom", "/iso/cn_windows_7_ultimate_with_sp1_x64_dvd_u_677408.iso",
   ```
   if you want to boot from cdrom,  you need to uncomment `"-boot","d"` in `docker-compose.yml`

6. run docker-compose(need to run in wsl2)
   ```shell
    > wsl
    > docker-compose up (on first run, it will take a long time to build the image, network should be well connected)
   ```

if you want to connect to the vm from vncviewer, you need to uncomment `"-vnc", ":0"` 
and expose port 5900 by uncomment `5900:5900` and run `docker-compose up` again, use vncviewer to connect to the vm with `localhost:5900`

# TODO
- [ ] support samba

# Reference
https://github.com/zhaodice/qemu-anti-detection.git