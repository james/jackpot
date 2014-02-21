require "httpclient"
require File.join(File.dirname(__FILE__), 'result.rb')
c = HTTPClient.new
conn = c.get_async("http://195.226.158.55:443/?_=1392857773092")
res = conn.pop
while str = res.content.read(999)
  match = str.match(/<LastResults>(.+?)<\/LastResults>/)
  if match
    results = match.captures.first.split(",").reverse
    Result.update(results)
  end
end