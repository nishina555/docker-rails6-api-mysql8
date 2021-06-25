require 'objspace'
namespace :batch do
  desc "直接メモリ計測"
  task memory_direct: :environment do
    users = User.all.map do |user|
      user.last_name
      puts ObjectSpace.memsize_of_all
    end
    puts ObjectSpace.memsize_of(users)

  end

  desc "yieldでメモリ計測"
  task memory: :environment do
    print_memory_usage do
      # Book.all.each do |book|
      #   book.price += 50
      #   book.save!
      # end
      # users = User.all.map(&:last_name)

      # users = User.all.pluck(:last_name)
      puts ObjectSpace.memsize_of(users)
    end
  end

  desc "yieldでメモリと時間計測"
  task mem_time: :environment do
    print_memory_usage do
      print_time_spent do
        users = User.all
        # User.all.map(&:last_name)
        # User.all.pluck(:last_name)
        users.map(&:last_name)
        # users.pluck(:last_name)
      end
    end
  end

  desc "bench test"
  task bench: :environment do
    n = 20
    # Benchmark.bm(10) do |x|
    #   x.report("pluck(:id)") { n.times { User.all.pluck(:id) } }
    #   x.report("map(&:id)") { n.times { User.all.map(&:id) } }
    # end

    # users = User.all
    # Benchmark.bm(10) do |x|
    #   x.report("map(&:id)") { n.times { users.map(&:id) } }
    #   x.report("pluck(:id)") { n.times { users.pluck(:id) } }
    # end

    Benchmark.bm(10) do |x|
      x.report("select(:id)") { n.times { User.select(:id) } }
      x.report("pluck(:id)") { n.times { User.pluck(:id) } }
    end
  end

  def print_memory_usage
    require 'objspace'
    memsize_before = ObjectSpace.memsize_of_all * 0.001 * 0.001
    rss_before = `ps -o rss= -p #{Process.pid}`.to_i * 0.001
    yield
    memsize_after = ObjectSpace.memsize_of_all * 0.001 * 0.001
    rss_after = `ps -o rss= -p #{Process.pid}`.to_i * 0.001
    puts "memsize_of_all: #{(memsize_after - memsize_before).round(2)} MB, rss: #{(rss_after - rss_before).round(2)} MB"
  end

  def print_time_spent
    time = Benchmark.realtime do
      yield
    end
    puts "Time: #{time.round(2)} secs"
  end
end
