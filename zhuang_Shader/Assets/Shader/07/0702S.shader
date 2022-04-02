Shader "Unlit/0702S"
{
    Properties
    {
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            struct VertexInput
            {
                float4 vertex : POSITION; //将模型顶点信息输入进来
            };

            struct VertexOutput
            {
                float4 posCS : SV_POSITION;//由模型顶点信息换算而来的顶点屏幕位置
                LIGHTING_COORDS(0,1)
            };

            VertexOutput vert(VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                o.posCS = UnityObjectToClipPos(v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(O)
                return o;
            }

            float4 frag(VertexOutput i) : COLOR
            {
                //准备变量
                float shadow = LIGHT_ATTENUATION(i);
                return float4(shadow,shadow,shadow,1);
                //return float4(1.0,1.0,1.0,1.0);
            }
            ENDCG
        }
    }
}
