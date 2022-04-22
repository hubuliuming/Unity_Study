Shader "Unlit/NormaizeCode"
{
    Properties
    {
       _NormalMap("NormalMap",2D) = "bump"{}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fog

            #include "UnityCG.cginc"
            uniform sampler2D _NormalMap;

            struct VertexInput
            {
                float4 vertex : POSITION;
                float2 uv0 : TEXCOORD0;
                float4 normal : NORMAl;
                float4 tangent : TEXCOORD2;
            };

            struct VertexOutput
            {
                float4 pos : POSITION;
                float2 uv0 : TEXCOORD0;
                float3 nDirWS : TEXCOORD1;
                float3 tDirWS : TEXCOORD2;
                float3 bDirWS : TEXCOORD3;
            };

            VertexOutput vert (VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                o.pos =  UnityObjectToClipPos(v.vertex);
                o.uv0 = v.uv0;
                o.nDirWS = UnityObjectToWorldNormal(v.normal);
                o.tDirWS = normalize(mul(unity_ObjectToWorld,float4(v.tangent.xyz,0)).xyz);
                o.nDirWS = normalize(cross(o.nDirWS,o.tDirWS) * v.tangent.w);
                return o;
            }

            float4 frag(VertexOutput i) : COLOR
            {
                float3 var_normalMap = UnpackNormal(tex2D(_NormalMap,i.uv0)).rgb;
                float3x3 TBN = float3x3(i.tDirWS,i.bDirWS,i.nDirWS);
                //float3 nDir = normalize(i.nDirWS);
                float3 nDir = normalize(mul(var_normalMap,TBN));
                float3 lDir = _WorldSpaceLightPos0.xyz;

                float ndotl = dot(nDir,lDir);
                float lambert  = max(0,ndotl);
                return float4(lambert,lambert,lambert,1.0);
            }
            ENDCG
        }
    }
}
