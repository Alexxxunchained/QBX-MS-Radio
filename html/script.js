let currentChannel = 0;

window.addEventListener('message', function(event) {
    const data = event.data;
    const permanentInfo = document.getElementById('permanentRadioInfo');
    
    if (data.type === 'openRadio') {
        permanentInfo.style.display = 'none';
        document.getElementById('radioContainer').style.display = 'block';
        
        if (data.jobChannels) {
            const jobChannelsDiv = document.getElementById('jobChannels');
            jobChannelsDiv.style.display = 'block';
            jobChannelsDiv.innerHTML = `
                <div class="section-title">${data.jobChannels.title}</div>
                <div class="channels-list">
                    ${data.jobChannels.channels.map(channel => `
                        <div class="channel-item" data-channel="${channel.channel}">
                            <span class="channel-name">${channel.name}</span>
                            <span class="channel-actions">▼</span>
                        </div>
                    `).join('')}
                </div>
            `;
            
            document.querySelectorAll('.channel-item').forEach(item => {
                item.addEventListener('click', function() {
                    const channel = this.getAttribute('data-channel');
                    if (channel) {
                        joinChannel(parseInt(channel));
                    }
                });
            });
        }
    } else if (data.type === 'updateChannel') {
        currentChannel = data.channel;
        const displayText = data.channelName ? `${data.channel}: ${data.channelName}` : data.channel;
        document.getElementById('currentChannel').textContent = displayText;
        document.getElementById('permanentChannel').textContent = displayText;
        
        if (data.channel === 0) {
            permanentInfo.style.display = 'none';
        } else if (document.getElementById('radioContainer').style.display === 'none') {
            permanentInfo.style.display = 'block';
        }
    } else if (data.type === 'hideRadio') {
        document.getElementById('radioContainer').style.display = 'none';
        if (currentChannel !== 0) {
            permanentInfo.style.display = 'block';
        }
    } else if (data.type === 'updateMembers') {
        if (document.getElementById('radioContainer').style.display === 'block') {
            updateMembersList(data.members);
        }
        updatePermanentMembersList(data.members);
    } else if (data.type === 'updateTalking') {
        const members = document.querySelectorAll('.permanent-member');
        members.forEach(member => {
            if (member.dataset.source === data.source.toString()) {
                if (data.isSpeaking) {
                    member.classList.add('talking');
                } else {
                    member.classList.remove('talking');
                }
            }
        });
    } else if (data.type === 'hideAll') {
        document.getElementById('radioContainer').style.display = 'none';
        document.getElementById('permanentRadioInfo').style.display = 'none';
    } else if (data.type === 'showPermanent') {
        if (document.getElementById('radioContainer').style.display === 'none' && currentChannel !== 0) {
            document.getElementById('permanentRadioInfo').style.display = 'block';
        }
    }
});

document.getElementById('frequencyInput').addEventListener('keypress', function(e) {
    if (e.key === 'Enter') {
        const channel = parseInt(this.value);
        if (channel && channel >= 1 && channel <= 999) {
            joinChannel(channel);
            this.value = '';
        }
    }
});

document.getElementById('closeRadio').addEventListener('click', function() {
    fetch(`https://${GetParentResourceName()}/closeRadio`, {
        method: 'POST'
    });
});

function joinChannel(channel) {
    fetch(`https://${GetParentResourceName()}/joinChannel`, {
        method: 'POST',
        body: JSON.stringify({
            channel: channel
        })
    });
}

document.addEventListener('keyup', function(event) {
    if (event.key === 'Escape') {
        fetch(`https://${GetParentResourceName()}/closeRadio`, {
            method: 'POST'
        });
    }
});

document.getElementById('leaveChannel').addEventListener('click', function() {
    fetch(`https://${GetParentResourceName()}/leaveChannel`, {
        method: 'POST'
    });
    const membersDiv = document.getElementById('channelMembers');
    membersDiv.style.display = 'none';
    document.getElementById('currentChannel').textContent = '0';
});

function updatePermanentMembersList(members) {
    const permanentMembers = document.getElementById('permanentMembers');
    if (members && members.length > 0) {
        permanentMembers.innerHTML = members.map(member => `
            <div class="permanent-member" data-source="${member.source}">
                <span class="permanent-member-name">${member.name}</span>
                <span class="permanent-member-job">ID: ${member.source}</span>
            </div>
        `).join('');
    } else {
        permanentMembers.innerHTML = '';
    }
}

function updateMembersList(members) {
    const membersDiv = document.getElementById('channelMembers');
    const membersList = membersDiv.querySelector('.members-list');
    
    if (members && members.length > 0) {
        membersDiv.style.display = 'block';
        membersList.innerHTML = members.map(member => `
            <div class="member-item">
                <span class="member-name">${member.name}</span>
                <span class="member-job">ID: ${member.source}</span>
            </div>
        `).join('');
    } else {
        membersDiv.style.display = 'none';
    }
} 