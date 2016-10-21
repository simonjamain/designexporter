require 'yaml'

class PluginLoader
  def initialize(pluginPath)
    @pluginPath = pluginPath
  end

  def call(pluginName, arguments)
    system("#{File.join(@pluginPath,pluginName,'main')} #{arguments}")
  end
end
