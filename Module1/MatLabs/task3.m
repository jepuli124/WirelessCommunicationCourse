
devicesProbability = 0.2:0.05:1;
numberOfDevices = 0:50;
UsedSlotsList = [];
UnUsedSlotsList = [];

for P = devicesProbability
    usedSlots = 0;
    unUsedSlots = 0;
for N = numberOfDevices
    if(rand() < P)
        usedSlots = usedSlots + 1;
    else
        unUsedSlots = unUsedSlots + 1;
    end
end
    UsedSlotsList(end + 1) = usedSlots/N;
    UnUsedSlotsList(end + 1) = unUsedSlots/N;
end

figure; %making figure
hold on;
xlabel('activity probability (p)');
ylabel('Fraction of slots');

% Plot the results
plot(devicesProbability, UsedSlotsList, 'b-o', 'DisplayName', 'fraction of used slots');
plot(devicesProbability, UnUsedSlotsList, 'g-o', 'DisplayName', 'fraction of unused slots');
legend('show');
hold off;