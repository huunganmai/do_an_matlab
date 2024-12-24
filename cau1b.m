% Khai báo dữ liệu đầu vào
xa = [0.1 0.3 0.5 0.7 0.9];
ya = [0.1002 0.3047 0.5236 0.7754 1.1198];
x_ct = 0.7;

syms x;
n = length(xa);
P = 0; % Khởi tạo đa thức nội suy P ban đầu là 0
% Thuật toán tìm đa thức nội suy Lagrange
for i = 1:n
    product = ya(i); % Khởi tạo product
    for j = 1:n
        if i ~= j
            product = product * (x - xa(j)) / (xa(i) - xa(j));
        end
    end
    P = P + product; % Thêm tích product vào đa thức nội suy
end

% Tính đạo hàm của đa thức nội suy vừa tim được
P_dh = matlabFunction(diff(P));
result = P_dh(x_ct); % Tính giá trị đạo hàm tại điểm x cần tìm
disp(result); % Hiển thị kết quả

