#define complexity 40.
#define fluid_speed 100.
#define color_intensity.5

uniform float uTime;
uniform vec2 resolution;

varying vec2 vUv;

void main(){
    
    vec2 p=(2.*gl_FragCoord.xy-resolution)/max(resolution.x,resolution.y);
    
    for(float i=1.;i<complexity;i++){
        vec2 np=p+uTime*.001;
        np.x+=.6/i*sin(i*p.y+uTime/fluid_speed+20.3*i)+.5;
        np.y+=.6/i*sin(i*p.x+uTime/fluid_speed+.3*(i+10.))-.5;
        p=np;
    }
    
    float f1=color_intensity*sin(3.*p.y)+color_intensity;
    float f2=.001*color_intensity*sin(p.x+p.y)+color_intensity;
    
    vec3 col=vec3(f1/2.+f2,f1/2.,1.);// play here for colors
    
    gl_FragColor=vec4(col,1.);
}