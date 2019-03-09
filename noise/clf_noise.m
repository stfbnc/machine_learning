beta = [0, 1, 2];
colours = {'white', 'pink', 'red'};
M = 100:10:3000;
n_it = 10;

path_file = sprintf('./clf_noise.txt');
f = fopen(path_file, 'w');
if f < 0
    error('Failed to open %s', path_file)
end
file_name = './dfa.txt';
for i = 1:n_it
    fprintf(1, '\n');
    fprintf(1, '%d\n', i);
    fprintf(1, '\n');
    for j = 1:length(beta)
        for k = 1:length(M)
            all_noise(beta(j), M(k));
            ex_string = './dfa ./tmp_noise.txt 4 1 1 .';
            system(ex_string);
            H_file = load(file_name);
            H = H_file(1, 4);
            fprintf(f, '%f %d %d %s\n', H, M(k), beta(j), colours{j});
        end
    end
end
fclose(f);
delete('./tmp_noise.txt');
delete(file_name);
