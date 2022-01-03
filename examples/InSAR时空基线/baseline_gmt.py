def baseline(in_file, out_file):
    with open(out_file, 'w+', encoding='UTF-8') as fout:
        with open(in_file, 'r', encoding='UTF-8') as fin:
            for line in fin.readlines():
                if line.strip():
                    sp = line.strip().split()
                    fout.write(f">\n")
                    fout.write(f"{sp[1]}  {sp[7]}\n")
                    fout.write(f"{sp[2]}  {sp[8]}\n")


# gawk is OK (using GAMMA command 'base_calc' to get 'bperp_file')
# gawk '{print ">"}{print $2,$8}{print $3,$9}' bperp_file > baseline

baseline('bperp_file', 'baseline')