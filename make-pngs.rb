#!/usr/bin/ruby
if ARGV.length != 1 then
    puts "Usage: make-pngs batik_path"
    puts "  where batik_path is the path to Apache Batik's main directory"
    exit
end
batik_path = ARGV[0]
Dir['svg/*.svg'].each do |file|
    [40,48,64,96,128].each do |size|
        outfile = /svg\/(.*).svg/.match(file)[1] + "-#{size}.png"
        cmd = "java -jar #{batik_path}/batik-rasterizer.jar -w #{size} -h #{size} -d png/#{outfile} #{file}"
        system cmd
    end
end
