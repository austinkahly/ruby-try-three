class BaseSerializer < ActiveModel::Serializer
  def can?(action, obj)
    @ability ||= Ability.new(scope)
    @ability.can?(action, obj)
  end
end