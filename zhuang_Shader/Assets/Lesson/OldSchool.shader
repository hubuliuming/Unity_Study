Shader "Unlit/OldSchool"
{
    Properties
    {
        _MainCol ("颜色",color) = (1.0,1.0,1.0,1.0)
        _SpecularPow ("高光次幂",range(0,90)) = 30
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        Pass
        {
            Name "FORWARD"
            Tags{
                "LightMode" = "ForwardBase"    
            }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            #include "UnityCG.cginc"
            //声明
            float3 _MainCol;
            float _SpecularPow;
            
            //输入结构
            struct VertexInput
            {
                float4 vertex : POSITION;
                float4 normal : NORMAL;
            };
            //输出结构
            struct VertexOutput
            {
                float4 posCS : SV_POSITION;
                float4 posWS : TEXCOORD0;
                float3 nDirW : TEXCOORD1;
            };
            //输入结构 》》 顶点shader 》》 输出结构
            VertexOutput vert (VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                o.posCS = UnityObjectToClipPos(v.vertex);
                o.posWS = mul(unity_ObjectToWorld,v.vertex);
                o.nDirW = UnityObjectToWorldNormal(v.normal);
                return o;
            }
            //输出结构 》》 像素    
            float4 frag(VertexOutput i) : COLOR
            {
                //准备向量
                float3 nDir  = i.nDirW;
                float3 IDir = _WorldSpaceLightPos0.xyz;
                float3 vDir = _WorldSpaceCameraPos.xyz - i.posWS;
                float3 hDir = normalize(vDir + IDir);
                //准备中间数据
                float nDotl = dot(i.nDirW,IDir);
                float nDoth = dot(nDir,hDir);
                //光照模型
                float lambert = max(0.0,nDotl);
                float blinnPhone = pow(max(0.0,nDoth), _SpecularPow);
                float3 finalRGB = _MainCol * lambert + blinnPhone;
                return float4(finalRGB,1.0);
                //return float4(1.0,1.0,1.0,1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
