#pragma once
// NFS UG2 - ReShade Pre FENg Hook
#define FEMANAGER_RENDER_HOOKADDR1 0x005CC1FB
#define FEMANAGER_RENDER_HOOKADDR2 0x005CC1FB
#define FEMANAGER_RENDER_ADDRESS 0x005378C0
#define NFS_D3D9_DEVICE_ADDRESS 0x00870974

void __stdcall FEManager_Render_Hook();
