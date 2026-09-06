

numberOfDevices = 1:20;
probabilityOfActivation = 0.1:0.1:0.4;
data = 0:20;
AllowedTime = 1:5;

amountOfRoundsRandom = [];
amountOfRoundsScheduled = [];


for N = numberOfDevices
    roundTime = 0;
    for D = data
        for P = probabilityOfActivation 
            deviceProgress = [];
            for device = 1:N
                deviceProgress(end + 1) = 0;
            end
            allDevicesNOTSatisfied = true;
            while allDevicesNOTSatisfied
                DevicesTryingToFireOf = [];
                for device = 1:N
                    if(rand() <= P)
                        DevicesTryingToFireOf(end + 1) = device;
                    end
                end
                if(length(DevicesTryingToFireOf) == 1)
                    deviceNumber = DevicesTryingToFireOf(end);
                    deviceProgress(deviceNumber) = 1;
                    roundTime = roundTime + D;
                    if(~ismember(0, deviceProgress))
                        allDevicesNOTSatisfied = false;
                    end
                end
            end
        end
    end
    amountOfRoundsRandom(end+1) = roundTime;
end

for N = numberOfDevices
    time = 0;
    for D = data
        for T = AllowedTime
            time = time + ((D)* N) + ceil(D/T);
        end
    end
    
    amountOfRoundsScheduled(end + 1) = time;
end


figure; %making figure
hold on;
xlabel('Number of devices');
ylabel('Amount of rounds needed');

% Plot the results
plot(numberOfDevices, amountOfRoundsRandom, 'b-o', 'DisplayName', 'Slotted Random');
plot(numberOfDevices, amountOfRoundsScheduled, 'g-o', 'DisplayName', 'Scheduled');
legend('show');
hold off;