module EditableHelper
  def xeditable? object = nil
    policy(object).update?
  end
end
