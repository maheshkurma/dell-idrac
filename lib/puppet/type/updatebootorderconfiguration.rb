#
# Update Boot order sequence configuration
#

Puppet::Type.newtype(:updatebootorderconfiguration) do
  @doc = "update boot order sequence  configuration."

  ensurable do
    newvalue(:present) do
      provider.create
    end
    defaultto(:present)
  end

  newparam(:name) do
    desc "The test name."
    munge do |value|
      value.to_s
    end

    validate do |value|
      if value.strip.length == 0
        raise ArgumentError, "The name must contain a value. It cannot be null."
      end
    end
  end

  newparam(:target_boot_device) do
    desc "Target Boot Device."
    defaultto("NIC")
    munge do |value|
      value.to_s
    end

    validate do |value|
      if value.strip.length == 0
        raise ArgumentError, "The target_boot_device  must contain a value. It cannot be null."
      end
    end
  end

end

