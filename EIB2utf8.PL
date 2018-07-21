# eib形式の漢点字データをUnicode点字のデータに変換します。
# 実行にはConvert-Brailleモジュールが必要です。
# 使い方:
# perl eib2utf8.pl ファイル名
# .eibの拡張子は無しで、その前のファイル名だけを指定します。
# 指定したファイル名に、.utf8.txtをつけたファイル名で出力します。

  use Convert::Braille;
  use utf8;

  $filename = $ARGV[0];
  die "No input filename.\n" unless $filename;
  $in = $filename . ".eib";

  $out = $filename . ".utf8.txt";

  open(IN, "< $in");
  open(OUT, "> $out");

  binmode(OUT, ":utf8");

  $header_byte = 442;

  read(IN,$b,$header_byte);

  $charcount = 0;

  while (read(IN,$b,1)){ # 1
  $dots = unpack("H2", $b);

  # begin

  $dots =~ s/d3/klpqr/;
  $dots =~ s/5b/lnpqr/;
  $dots =~ s/75/lmoqr/;
  $dots =~ s/fd/klmnoqr/;
  $dots =~ s/f5/klmoqr/;
  $dots =~ s/7d/lmnoqr/;
  $dots =~ s/77/lmopqr/;
  $dots =~ s/ff/klmnopqr/;
  $dots =~ s/f7/klmopqr/;
  $dots =~ s/7f/lmnopqr/;
  $dots =~ s/73/lmpqr/;
  $dots =~ s/fb/klmnpqr/;
  $dots =~ s/f3/klmpqr/;
  $dots =~ s/7b/lmnpqr/;
  $dots =~ s/35/moqr/;
  $dots =~ s/b5/kmoqr/;
  $dots =~ s/3d/mnoqr/;
  $dots =~ s/37/mopqr/;
  $dots =~ s/b7/kmopqr/;
  $dots =~ s/3f/mnopqr/;
  $dots =~ s/27/mopr/;
  $dots =~ s/a7/kmopr/;
  $dots =~ s/2f/mnopr/;
  $dots =~ s/20/m/;
  $dots =~ s/a8/kmn/;
  $dots =~ s/a0/km/;
  $dots =~ s/b8/kmnq/;
  $dots =~ s/b0/kmq/;
  $dots =~ s/22/mp/;
  $dots =~ s/48/ln/;
  $dots =~ s/a2/kmp/;
  $dots =~ s/a3/kmpr/;
  $dots =~ s/a9/kmnr/;
  $dots =~ s/a1/kmr/;
  $dots =~ s/b2/kmpq/;
  $dots =~ s/bb/kmnpqr/;
  $dots =~ s/b3/kmpqr/;
  $dots =~ s/31/mqr/;
  $dots =~ s/b9/kmnqr/;
  $dots =~ s/b1/kmqr/;
  $dots =~ s/12/pq/;
  $dots =~ s/92/kpq/;
  $dots =~ s/13/pqr/;
  $dots =~ s/9b/knpqr/;
  $dots =~ s/93/kpqr/;
  $dots =~ s/14/oq/;
  $dots =~ s/9c/knoq/;
  $dots =~ s/94/koq/;
  $dots =~ s/1c/noq/;
  $dots =~ s/15/oqr/;
  $dots =~ s/9d/knoqr/;
  $dots =~ s/95/koqr/;
  $dots =~ s/1d/noqr/;
  $dots =~ s/16/opq/;
  $dots =~ s/9e/knopq/;
  $dots =~ s/96/kopq/;
  $dots =~ s/1e/nopq/;
  $dots =~ s/17/opqr/;
  $dots =~ s/9f/knopqr/;
  $dots =~ s/97/kopqr/;
  $dots =~ s/1f/nopqr/;
  $dots =~ s/10/q/;
  $dots =~ s/98//; # new line
  $dots =~ s/90/kq/;
  $dots =~ s/18/nq/;
  $dots =~ s/ef/klmnopr/;
  $dots =~ s/de/klnopq/;
  $dots =~ s/ac/kmno/;
  $dots =~ s/ab/kmnpr/;
  $dots =~ s/ad/kmnor/;
  $dots =~ s/ae/kmnop/;
  $dots =~ s/af/kmnopr/;
  $dots =~ s/bc/kmnoq/;
  $dots =~ s/bd/kmnoqr/;
  $dots =~ s/be/kmnopq/;
  $dots =~ s/bf/kmnopqr/;
  $dots =~ s/cd/klnor/;
  $dots =~ s/ce/klnop/;
  $dots =~ s/cf/klnopr/;
  $dots =~ s/df/klnopqr/;
  $dots =~ s/aa/kmnp/;
  $dots =~ s/c6/klop/;
  $dots =~ s/23/mpr/;
  $dots =~ s/03/pr/;
  $dots =~ s/32/mpq/;
  $dots =~ s/21/mr/;
  $dots =~ s/33/mpqr/;
  $dots =~ s/02/p/;
  $dots =~ s/00/ /;
  $dots =~ s/30/mq/;
  $dots =~ s/9a/knpq/;
  $dots =~ s/1a/npq/;
  $dots =~ s/28/mn/;
  $dots =~ s/6a/lmnp/;
  $dots =~ s/3a/mnpq/;
  $dots =~ s/2a/mnp/;
  $dots =~ s/38/mnq/;
  $dots =~ s/6b/lmnpr/;
  $dots =~ s/88/kn/;
  $dots =~ s/80/k/;
  $dots =~ s/08/n/;
  $dots =~ s/40/l/;
  $dots =~ s/c8/kln/;
  $dots =~ s/c0/kl/;
  $dots =~ s/60/lm/;
  $dots =~ s/e8/klmn/;
  $dots =~ s/e0/klm/;
  $dots =~ s/44/lo/;
  $dots =~ s/cc/klno/;
  $dots =~ s/c4/klo/;
  $dots =~ s/46/lop/;
  $dots =~ s/42/lp/;
  $dots =~ s/ca/klnp/;
  $dots =~ s/4c/lno/;
  $dots =~ s/c2/klp/;
  $dots =~ s/64/lmo/;
  $dots =~ s/ec/klmno/;
  $dots =~ s/e4/klmo/;
  $dots =~ s/66/lmop/;
  $dots =~ s/ee/klmnop/;
  $dots =~ s/e6/klmop/;
  $dots =~ s/6e/lmnop/;
  $dots =~ s/62/lmp/;
  $dots =~ s/e2/klmp/;
  $dots =~ s/24/mo/;
  $dots =~ s/a4/kmo/;
  $dots =~ s/2c/mno/;
  $dots =~ s/26/mop/;
  $dots =~ s/a6/kmop/;
  $dots =~ s/2e/mnop/;
  $dots =~ s/50/lq/;
  $dots =~ s/d8/klnq/;
  $dots =~ s/d0/klq/;
  $dots =~ s/58/lnq/;
  $dots =~ s/70/lmq/;
  $dots =~ s/f8/klmnq/;
  $dots =~ s/f0/klmq/;
  $dots =~ s/78/lmnq/;
  $dots =~ s/54/loq/;
  $dots =~ s/dc/klnoq/;
  $dots =~ s/d4/kloq/;
  $dots =~ s/5c/lnoq/;
  $dots =~ s/56/lopq/;

  $dots =~ s/d6/klopq/;
  $dots =~ s/5e/lnopq/;
  $dots =~ s/52/lpq/;
  $dots =~ s/d2/klpq/;
  $dots =~ s/74/lmoq/;
  $dots =~ s/fc/klmnoq/;
  $dots =~ s/f4/klmoq/;
  $dots =~ s/7c/lmnoq/;
  $dots =~ s/76/lmopq/;
  $dots =~ s/fe/klmnopq/;
  $dots =~ s/f6/klmopq/;
  $dots =~ s/7e/lmnopq/;
  $dots =~ s/72/lmpq/;
  $dots =~ s/f2/klmpq/;
  $dots =~ s/34/moq/;
  $dots =~ s/b4/kmoq/;
  $dots =~ s/3c/mnoq/;
  $dots =~ s/36/mopq/;
  $dots =~ s/b6/kmopq/;
  $dots =~ s/3e/mnopq/;
  $dots =~ s/51/lqr/;
  $dots =~ s/d9/klnqr/;
  $dots =~ s/d1/klqr/;
  $dots =~ s/59/lnqr/;
  $dots =~ s/71/lmqr/;
  $dots =~ s/f9/klmnqr/;
  $dots =~ s/f1/klmqr/;
  $dots =~ s/79/lmnqr/;
  $dots =~ s/55/loqr/;
  $dots =~ s/dd/klnoqr/;
  $dots =~ s/d5/kloqr/;
  $dots =~ s/5d/lnoqr/;
  $dots =~ s/57/lopqr/;
  $dots =~ s/d7/klopqr/;
  $dots =~ s/5f/lnopqr/;
  $dots =~ s/53/lpqr/;
  $dots =~ s/db/klnpqr/;
  $dots =~ s/11/qr/;
  $dots =~ s/99/knqr/;
  $dots =~ s/91/kqr/;
  $dots =~ s/19/nqr/;
  $dots =~ s/04/o/;
  $dots =~ s/8c/kno/;
  $dots =~ s/84/ko/;
  $dots =~ s/0c/no/;
  $dots =~ s/82/kp/;
  $dots =~ s/0a/np/;
  $dots =~ s/1b/npqr/;
  $dots =~ s/01/r/;
  $dots =~ s/89/knr/;
  $dots =~ s/81/kr/;
  $dots =~ s/09/nr/;
  $dots =~ s/06/op/;
  $dots =~ s/8e/knop/;
  $dots =~ s/86/kop/;
  $dots =~ s/0e/nop/;
  $dots =~ s/05/or/;
  $dots =~ s/8d/knor/;
  $dots =~ s/85/kor/;
  $dots =~ s/0d/nor/;
  $dots =~ s/8b/knpr/;
  $dots =~ s/83/kpr/;
  $dots =~ s/0b/npr/;
  $dots =~ s/07/opr/;
  $dots =~ s/8f/knopr/;
  $dots =~ s/87/kopr/;
  $dots =~ s/0f/nopr/;
  $dots =~ s/41/lr/;
  $dots =~ s/c9/klnr/;
  $dots =~ s/c1/klr/;
  $dots =~ s/49/lnr/;
  $dots =~ s/61/lmr/;
  $dots =~ s/e9/klmnr/;
  $dots =~ s/e1/klmr/;
  $dots =~ s/69/lmnr/;
  $dots =~ s/45/lor/;
  $dots =~ s/c5/klor/;
  $dots =~ s/4d/lnor/;
  $dots =~ s/47/lopr/;
  $dots =~ s/c7/klopr/;
  $dots =~ s/4f/lnopr/;
  $dots =~ s/43/lpr/;
  $dots =~ s/cb/klnpr/;
  $dots =~ s/c3/klpr/;$dots =~ s/4b/lnpr/;
  $dots =~ s/65/lmor/;
  $dots =~ s/ed/klmnor/;
  $dots =~ s/e5/klmor/;
  $dots =~ s/6d/lmnor/;
  $dots =~ s/67/lmopr/;
  $dots =~ s/e7/klmopr/;
  $dots =~ s/6f/lmnopr/;
  $dots =~ s/63/lmpr/;
  $dots =~ s/eb/klmnpr/;
  $dots =~ s/e3/klmpr/;
  $dots =~ s/25/mor/;
  $dots =~ s/a5/kmor/;
  $dots =~ s/2d/mnor/;
  $dots =~ s/ba/kmnpq/;
  $dots =~ s/68/lmn/;
  $dots =~ s/da/klnpq/;
  $dots =~ s/4e/lnop/;
  $dots =~ s/fa/klmnpq/;
  $dots =~ s/6c/lmno/;
  $dots =~ s/ea/klmnp/;
  $dots =~ s/4a/lnp/;
  $dots =~ s/2b/mnpr/;
  $dots =~ s/5a/lnpq/;
  $dots =~ s/29/mnr/;
  $dots =~ s/7a/lmnpq/;
  $dots =~ s/3b/mnpqr/;
  $dots =~ s/8a/knp/;
  $dots =~ s/39/mnqr/;

  # end

  $dots =~ tr/klmnopqr/12345678/;

  $utf8 = brailleDotsToUnicode($dots);

  $utf8_line = $utf8_line . $utf8;
  $charcount++;

  if($charcount == 41){
  $utf8_line =~ s/ +$//;
  print (OUT "  $utf8_line\n");
  $utf8_line = "";
  $charcount = 0;
  }
  } # 1

  close(IN);
  close(OUT);

  exit;
