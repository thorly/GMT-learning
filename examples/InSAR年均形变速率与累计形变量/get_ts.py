import numpy as np

def point2ts(num, ts_file, out_file):
    ts = np.loadtxt(ts_file)
    date = ts[0, 4:]
    point_ts = ts[num, 4:]
    out_data = np.vstack((date, point_ts))
    out_data = out_data.T
    np.savetxt(out_file, out_data, fmt='%4f')



point2ts(9760, 'des_ts.txt', 'A-des.txt')
point2ts(9586, 'des_ts.txt', 'B-des.txt')
point2ts(9001, 'des_ts.txt', 'F-des.txt')
point2ts(8607, 'des_ts.txt', 'D-des.txt')
point2ts(6911, 'des_ts.txt', 'E-des.txt')


point2ts(7097, 'asc_ts.txt', 'A-asc.txt')
point2ts(6990, 'asc_ts.txt', 'B-asc.txt')
point2ts(7305, 'asc_ts.txt', 'C-asc.txt')
point2ts(7392, 'asc_ts.txt', 'D-asc.txt')
point2ts(8961, 'asc_ts.txt', 'E-asc.txt')