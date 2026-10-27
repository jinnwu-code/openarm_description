#!/usr/bin/env bash
set -e
cd "$(dirname "${BASH_SOURCE[0]}")"
case "${1:-}" in
  --help|-h) echo 'Usage: bash install.sh [--check]. Run the shared install_system.sh first; build the full workspace with openarm_ros2/install.sh.'; exit 0 ;;
  --check|'') ;;
  *) exit 2 ;;
esac
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:$PATH
unset PYTHONPATH
source /opt/ros/humble/setup.bash
workspace=$(realpath ../..)
if [[ ${1:-} != --check ]]; then
  cd "$workspace"
  colcon build --symlink-install --packages-select openarm_description --cmake-args -DBUILD_TESTING=OFF -DPython3_EXECUTABLE=/usr/bin/python3
fi
source "$workspace/install/setup.bash"
ros2 pkg prefix openarm_description
echo 'Description package ready; the full robot build is in ../openarm_ros2/install.sh.'
