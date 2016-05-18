class AddOtherAttachmentFieldsToInquiries < ActiveRecord::Migration
  def self.up
    add_attachment :inquiries, :attachment2
    add_attachment :inquiries, :attachment3
    add_attachment :inquiries, :attachment4
    add_attachment :inquiries, :attachment5
  end

  def self.down
    remove_attachment :inquiries, :attachment2
    remove_attachment :inquiries, :attachment3
    remove_attachment :inquiries, :attachment4
    remove_attachment :inquiries, :attachment5
  end
end