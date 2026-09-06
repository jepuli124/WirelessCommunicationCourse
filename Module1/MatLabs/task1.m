

ChangeOfDeviceFirering = 0.10; 

for M = 20:10:40 % time slots
idleList = [];
succList = [];
collList = [];

%these are looped to handle single values, .
for N = 0:1:20 % devices
    
        ListOfFiredDevices = [];
        idles = 0; % counts idle states
        succ = 0; % counts succ states
        colls = 0; % counts colls states
        for amountOfSlots = 0:M
            DevicesTryingToFireOf = [];
            for deviceNumber = 0:N
                if(~ismember(deviceNumber,ListOfFiredDevices))
                   if(rand() <= ChangeOfDeviceFirering)
                        DevicesTryingToFireOf(end + 1) = deviceNumber;
                   end
                end                
            end
            if(length(DevicesTryingToFireOf) == 0)
                idles = idles + 1;
            end
            if(length(DevicesTryingToFireOf) == 1)
                succ = succ + 1;
                ListOfFiredDevices = [ListOfFiredDevices, DevicesTryingToFireOf];
            end
            if(length(DevicesTryingToFireOf) > 1)
                colls = colls + 1;
            end
        end
        % Store the results for the current time slot
        fprintf('Time Slots %d: Fired Devices %d = %s\n', M, length(ListOfFiredDevices), mat2str(ListOfFiredDevices));
        idleList(end + 1) = idles;
        succList(end + 1) = succ;
        collList(end + 1) = colls;
    
end


figure; %making figure
hold on;
xlabel('Number of devices');
ylabel('Number of States');
%legend('Pure ALOHA', 'Slotted ALOHA');

% Plot the results
plot(0:(length(idleList)-1), idleList, 'b-o', 'DisplayName', 'Idle States');
plot(0:(length(succList)-1), succList, 'g-o', 'DisplayName', 'Successful Fires');
plot(0:(length(collList)-1), collList, 'r-o', 'DisplayName', 'Collisions');
legend('show');
hold off;
end