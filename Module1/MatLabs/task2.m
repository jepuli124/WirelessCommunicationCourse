
G = 0:0.05:3;
S_pure = G.*exp(-2*G);
S_slotted = G.*exp(-G);

figure; 
plot(G,S_pure);
hold on;
plot(G,S_slotted);
grid on;
xlabel('Input (G)');
ylabel('Output (S)');
legend('Pure ALOHA', 'Slotted ALOHA');


