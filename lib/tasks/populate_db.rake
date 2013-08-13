namespace :db do
  desc "Erase and fill database with necessery info"
  task :populate => :environment do
    require 'populator'
#    require 'faker'

    [Report].each(&:delete_all)

    Report.populate 93 do |row|
      row.name = "report #{row.id}"
      row.description = Populator.sentences(1)
      row.height = [4.99, 19.95, 100]
      row.width = [1.29, 9.45, 150]
      row.length = [3.34, 2.66, 6.12]
    end

  end
end
