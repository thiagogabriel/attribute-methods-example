require 'active_model'

class Person
  include ActiveModel::AttributeMethods
  attr_accessor :name, :email

  attribute_method_suffix '_taken?'
  define_attribute_methods %w(name email)

  def initialize(params)
    @name = params[:name]
    @email = params[:email]
  end

  def attribute_taken?(attr)                        # def name_taken?(name)
    send("#{attr}_collection").include?(send(attr)) #   name_collection.include?(name)
  end                                               # end

  private
    def name_collection
      %w(Thiago Anézio Paulo Camila)
    end

    def email_collection
      %w(thiago@gmail.com anezio@uol.com.br paulo@ig.com.br camila@terra.com.br)
    end
end
