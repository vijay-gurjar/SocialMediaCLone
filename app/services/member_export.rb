require 'csv'
class ExportService::MemberExport

  def initialize(data)
    @data = data

  end

  def self.to_csv(options = {})
    attributes = %w{ id first_name last_name email phone_number roles_name subject_ids comment_ids like_ids}
    CSV.generate(options, headers: true) do |csv|
      csv << attributes
      @data.all.each do |member|
        csv << attributes.map {|attr| member.send(attr)}
      end
    end
  end


end