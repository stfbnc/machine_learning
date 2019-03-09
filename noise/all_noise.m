function all_noise(beta, M)

n = dsp.ColoredNoise(beta, M, 1);
n = n();

path_file = sprintf('./tmp_noise.txt');
f = fopen(path_file, 'w');
if f < 0
	error('Failed to open %s', path_file)
end
for i = 1:length(n)
	fprintf(f, '%f\n', n(i));
end
fclose(f);

end
