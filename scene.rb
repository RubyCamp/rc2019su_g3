class Scene
  @@scenes = {}
  @@vals = {}

  @@current_scene_name = nil

  def self.add(scene_obj, scene_name)
    @@scenes[scene_name.to_sym] = scene_obj
  end

  def self.move_to(scene_name)
    @@current_scene_name = scene_name.to_sym
  end

  def self.play
    @@scenes[@@current_scene_name].play
  end

  #以下二つ追加
  def self.set_val(name, value)
    @@vals[name.to_sym] = value
  end

  def self.get_val(name)
    return @@vals[name.to_sym]
  end
end