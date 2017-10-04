class LeadsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(leads_file)
    CSV.foreach(leads_file, headers: true) do |lead|
      Customer.create(title: lead[0], Arist.find_or_create_by: lead[1])
    end
  end
end
