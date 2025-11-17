#define ROOT_SIG "RootFlags(0), CBV(b0), UAV(u0)"

cbuffer Params : register(b0)
{
    uint LoadOffset;
};

RWByteAddressBuffer my_buffer : register(u0);

[RootSignature(ROOT_SIG)]
[numthreads(1, 1, 1)]
void mainCS(uint3 dtid: SV_DispatchThreadID)
{
    if(dtid.x > 0 || dtid.y > 0 || dtid.z > 0)
        return;
    uint value = my_buffer.Load(LoadOffset);
    my_buffer.Store(0, value);
}
