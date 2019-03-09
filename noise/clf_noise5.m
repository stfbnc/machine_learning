beta = [0, 0.5, 1, 1.5, 2];
clf_idx = [0, 1, 2, 3, 4];
colours = {'white', 'whink', 'pink', 'pired', 'red'};
M = 100:10:10000;
n_it = 10;

path_file = sprintf('./clf_noise5.txt');
f = fopen(path_file, 'w');
if f < 0
    error('Failed to open %s', path_file)
end
file_name = './dfa.txt';
ex_string = './dfa ./tmp_noise.txt 4 1 1 .';
for i = 1:n_it
    fprintf(1, '\n');
    fprintf(1, '%d\n', i);
    fprintf(1, '\n');
    for j = 1:length(beta)
        for k = 1:length(M)
            all_noise(beta(j), M(k));
            system(ex_string);
            H_file = load(file_name);
            H = H_file(1, 4);
            fprintf(f, '%f %d %d %s\n', H, M(k), clf_idx(j), colours{j});
        end
    end
end
fclose(f);
delete('./tmp_noise.txt');
delete(file_name);
