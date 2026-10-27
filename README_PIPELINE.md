# 六终端 OpenArm pipeline 安装

完整克隆顺序、资产包、设备配置和六终端命令见 [主复现指南](https://github.com/jinnwu-code/openarm_brainco/blob/main/README_PIPELINE.md)。
目标系统 Ubuntu 22.04 x86_64 / RTX 4090。先完成主指南的基础依赖安装与资产恢复。
资产下载：[openarm_extra_files（Google Drive）](https://drive.google.com/drive/folders/1Otaws2SrxEnM9XoRXNN5pFCoGpnc8uDT?usp=sharing)；按主指南步骤 3 下载六个文件并校验、解压。

```bash
bash install.sh
bash install.sh --check
```

不使用 conda；运行于 ROS 2 Humble。仓库应位于 `~/ros2_ws/src/openarm_description`。
先执行主指南中的 `install_system.sh`；本脚本构建 description 包。
完整硬件接口和 bringup 由同级 openarm_ros2/install.sh 构建；无需复制源机器的 install/build/log。

验证范围见主仓库的 [VALIDATION.md](https://github.com/jinnwu-code/openarm_brainco/blob/pipeline-repro-20261026-r2/VALIDATION.md)。
