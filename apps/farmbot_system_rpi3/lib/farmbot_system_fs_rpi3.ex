defmodule Module.concat([Farmbot, System, "rpi3", FileSystem]) do
  @moduledoc false
  @behaviour Farmbot.System.FS
  @state_path Application.get_env(:farmbot_system, :path)
  @block_device "/dev/mmcblk0p3"
  @fs_type "ext4"
  @ro_options ["-t", @fs_type, "-o", "ro,remount", @block_device, @state_path]
  @rw_options ["-t", @fs_type, "-o", "rw,remount", @block_device, @state_path]
  use Farmbot.System.NervesCommon.FileSystem,
      target: "rpi3",
      ro_options:   @ro_options,
      rw_options:   @rw_options,
      state_path:   @state_path,
      fs_type:      @fs_type,
      block_device: @block_device
end
