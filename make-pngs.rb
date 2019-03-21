#!/usr/bin/ruby
if ARGV.length != 1 then
    puts "Usage: make-pngs batik_path"
    puts "  where batik_path is the directory containing Apache Batik's"
    puts "  batik-rasterizer .jar file"
    exit
end
batik_path = ARGV[0]
Dir['svg/*.svg'].each do |file|
    [40,48,64,96,128,256].each do |size|
        outfile = /svg\/(.*).svg/.match(file)[1] + "-#{size}.png"
        cmd = "java -jar #{batik_path}/batik-rasterizer*.jar -w #{size} -h #{size} -d png/#{outfile} #{file}"
        system cmd
    end
end
