function [nghiem, solanlap] = daycung(f, a, b, saiso)
    syms x;
    fd1 = str2func(['@(x)' char(diff(f(x)))]);
    fd2 = str2func(['@(x)' char(diff(fd1(x)))]);

    % Biến điều kiện, nếu nostop = 0, điều kiện của hàm số không thỏa để sử
    % dụng phương pháp tiếp tuyến
    nostop = 1;

    % Giải để tìm các nghiệm khi đạo hàm cấp 1 và cấp 2 của f bằng 0
    %temp1 = double(solve(diff(f(x))));      % Mảng chứa các nghiệm của fd1
    %temp2 = double(solve(diff(fd1(x))));      % Mảng chứa các nghiện của fd2
    temp1 = double(solve(diff(f(x)))); 
    temp2 = double(solve(diff(fd1(x)))); 
    % Xét điều kiện để hội tụ: f'(x) không đổi dấu trên [a, b]
    % Nếu nghiệm của fd1 nằm trong đoạn [a, b] thì chứng tỏ nó đổi dâu
    % Trong [a, b]
    if ~isempty(temp1) 
        for i=1:length(temp1) 
            if (temp1(i)<=b) && (temp1(i)>=a) 
                disp('Ham f'' doi dau trong khoang phan li nghiem'); 
              nostop=0; 
              nghiem = NaN; 
              solanlap = NaN; 
              break; 
            end 
        end 
    end 
  %Kiem tra f"(x) co doi dau trong khoang phan li nghiem hay ko 
  if ~isempty(temp2) 
    for i=1:length(temp2) 
        if (temp2(i)<=b) && (temp2(i)>=a) 
          disp('Ham f" doi dau trong khoang phan li nghiem'); 
          nostop=0; 
          nghiem = NaN; 
          solanlap = NaN; 
          break; 
        end 
    end 
  end

    % nostop = 1 ==> hàm số thỏa điều kiện để sử dụng phương pháp dây cung
    if nostop
        imax = 10000;
        solanlap = 0;
        c_old = 0;
        for i = 1:1:imax
            c = (a* f(b) - b*f(a)) / (f(b) - f(a));
            solanlap = solanlap + 1;
     
            if f(a) * f(c) < 0
                b = c;
            else
                a = c;
            end

            if abs(c - c_old) <= saiso
                nghiem = c;
                return;
            end
            c_old = c;
        end
        nghiem = NaN;
        solanlap = NaN ;
    end
end