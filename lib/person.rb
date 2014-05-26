require 'active_model'

class Person
  include ActiveModel::AttributeMethods
  attr_accessor :name

  attribute_method_suffix '_taken?'
  define_attribute_methods %w(name)

  def initialize(params)
    @name = params[:name]
  end

  def attribute_taken?(attr)                        # def name_taken?(name)
    send("#{attr}_collection").include?(send(attr)) #   name_collection.include?(name)
  end                                               # end

  private
    def name_collection
      %w(Thiago Anézio Paulo Camila)
    end

end
