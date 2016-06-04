#!/usr/bin/env ruby

require './tester'

ROUTES = [*'A'..'H']

def solve(input)
  branchies, rock = input.split(':')
  routes = [ROUTES]
  branchies.chars.each do |branch|
    lowest_route = routes.last.dup
    left = branch.to_i - 1
    right = branch.to_i % 8
    lowest_route[left], lowest_route[right] = lowest_route[right], lowest_route[left]
    routes.push lowest_route
  end
  routes.transpose.map(&:join).reject {|routes| routes.include?(rock) }.map {|r| r[0] }.join
end

def test(input, expected)
  actual = solve(input)

  if actual == expected
    print "\x1b[32m.\x1b[0m"
  else
    puts <<~EOS
      \x1b[31m
      input:    #{input}
      expected: #{expected}
      actual:   #{actual}\x1b[0m
    EOS
  end
end

test('2512:C', 'DEFGH')
test('1:A', 'CDEFGH')
test(':C', 'ABDEFGH')
test('2345:B', 'AGH')
test('1256:E', 'ABCDH')
test('1228:A', 'ADEFG')
__END__
test('5623:B', 'AEFGH')
test('8157:C', 'ABDEFGH')
test('74767:E', 'ABCFGH')
test('88717:D', 'ABCEFGH')
test('148647:A', 'ACDEFH')
test('374258:H', 'BCDEFH')
test('6647768:F', 'ABCDEH')
test('4786317:E', 'ABFGH')
test('3456781:C', '')
test('225721686547123:C', 'CEF')
test('2765356148824666:F', 'ABCDEH')
test('42318287535641783:F', 'BDE')
test('584423584751745261:D', 'FGH')
test('8811873415472513884:D', 'CFG')
test('74817442725737422451:H', 'BCDEF')
test('223188865746766511566:C', 'ABGH')
test('2763666483242552567747:F', 'ABCG')
test('76724442325377753577138:E', 'EG')
test('327328486656448784712618:B', '')
test('4884637666662548114774288:D', 'DGH')
test('84226765313786654637511248:H', 'DEF')
test('486142154163288126476238756:A', 'CDF')
test('1836275732415226326155464567:F', 'BCD')
test('62544434452376661746517374245:G', 'G')
test('381352782758218463842725673473:B', 'A')
test('2512:C', 'DEFGH')
test('1:A', 'CDEFGH')
test(':C', 'ABDEFGH')
test('2345:B', 'AGH')
test('1256:E', 'ABCDH')
test('1228:A', 'ADEFG')
test('5623:B', 'AEFGH')
test('8157:C', 'ABDEFGH')
test('74767:E', 'ABCFGH')
test('88717:D', 'ABCEFGH')
test('148647:A', 'ACDEFH')
test('374258:H', 'BCDEFH')
test('6647768:F', 'ABCDEH')
test('4786317:E', 'ABFGH')
test('3456781:C', '')
test('225721686547123:C', 'CEF')
test('2765356148824666:F', 'ABCDEH')
test('42318287535641783:F', 'BDE')
test('584423584751745261:D', 'FGH')
test('8811873415472513884:D', 'CFG')
test('74817442725737422451:H', 'BCDEF')
test('223188865746766511566:C', 'ABGH')
test('2763666483242552567747:F', 'ABCG')
test('76724442325377753577138:E', 'EG')
test('327328486656448784712618:B', '')
test('4884637666662548114774288:D', 'DGH')
test('84226765313786654637511248:H', 'DEF')
test('486142154163288126476238756:A', 'CDF')
test('1836275732415226326155464567:F', 'BCD')
test('62544434452376661746517374245:G', 'G')
test('381352782758218463842725673473:B', 'A')
puts
