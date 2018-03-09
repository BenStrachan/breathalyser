class AddAttachmentColumn < ActiveRecord::Migration[5.1]
  def up
    add_attachment :jobs, :attachment
    add_attachment :job_reports, :attachment
  end

  def down
    remove_attachment :jobs, :attachment
    remove_attachment :job_reports, :attachment
  end
end
