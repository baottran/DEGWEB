class AddAttachmentToInquiries < ActiveRecord::Migration
  def self.up
    add_attachment :inquiries, :attachment
  end

  def self.down
    remove_attachment :inquiries, :attachment
  end
end
