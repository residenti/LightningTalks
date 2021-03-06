#
# Sample code to encrypt with inputed_key
#
# plaintext  : 平文.
# cryptogram : 暗号文.
# calculation_result : 足し算した後のascii_codeの値を一時的に格納.
#
# TODO: unpack/pack の c* について調べる.

# 入力.
puts "平文を入力して下さい (例. OLIVA)"
plaintext = gets.chop # 文字列の最後に打ったキャリッジリターンが入るので chop で取り除く.
puts "鍵を入力して下さい (例. 345)"
secret_key = gets.chop.split("") # "345" => ["3", "4", "5"]
puts "-----------------------------------"

ascii_code = plaintext.unpack("c*") # "OLIVA" => [79, 76, 73, 86, 65]
regression_index = 0
calculation_result = []

# 鍵を繰り返し足す.
ascii_code.each do |item|
  calculation_result.push(item + secret_key[regression_index].to_i)
  regression_index += 1
  regression_index = 0 if regression_index > secret_key.length - 1
end

# [82, 80, 78, 89, 69] => "RPNYE"
cryptogram = calculation_result.pack("c*")

puts <<"EOS"
平文   : #{plaintext} #{ascii_code}
暗号文 : #{cryptogram} #{calculation_result}
EOS


