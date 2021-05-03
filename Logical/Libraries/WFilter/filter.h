 /*
 ============================================================================
 Name        : filter.h
 Author      : B&R Industrial Automation
 Version     :
 Copyright   :
 Description : Filter program headers
 ============================================================================
 */

#ifndef WEIGH_FILTER_C_H
#define WEIGH_FILTER_C_H

#include <stdio.h>
#include <string.h>
#include <asmath.h>
//#include <math.h>

#ifdef BUILD_DLL
#define BUILD_DLL __declspec(dllexport)
#else
#define BUILD_DLL
#endif

BUILD_DLL typedef struct lowpass {
    float input;
    float level;
    float state;
    float output;
} lowpass_typ;

BUILD_DLL int lowpass(struct lowpass* inst);

typedef struct bufferstate {
    unsigned long read;
    unsigned long write;
} bufferstate_typ;

int buflen(bufferstate_typ* bufferstate, unsigned long maxlen);
int bufappend(bufferstate_typ* bufferstate, float* buffer, unsigned long maxlen, float value);
float bufpop(bufferstate_typ* bufferstate, float* buffer, unsigned long maxlen);

typedef struct mov_avg_state {
    bufferstate_typ bufferstate;
    float output;
} mov_avg_state_typ;

BUILD_DLL typedef struct mov_avg {
    float input;
    unsigned long samples;
    mov_avg_state_typ state;
    short error;
    float output;
} mov_avg_typ;

BUILD_DLL int mov_avg(struct mov_avg* inst, float* buffer, unsigned long bufferlen);

typedef struct second_order_fir_state {
    float input[2];
    float output[2];
} second_order_fir_state_typ;

float second_order_fir(float input, float a[2], float b[3], second_order_fir_state_typ* state);

float cascade_fir(float input, float a[4][2], float b[4][3], second_order_fir_state_typ state[4]);

BUILD_DLL typedef struct notch_fir {
    float input;
    int mode;
    second_order_fir_state_typ state[4];
    float output;
} notch_fir_typ;

BUILD_DLL int notch_fir(struct notch_fir* inst);

typedef struct kalman_state {
	/*
	 * x : Posterior state estimate vector
	 * P : Posterior covariance matrix
	*/
    float x[2];
    float P[2][2];
} kalman_state_typ;

int dot_product(float in1[2][2], float in2[2][2], float out[2][2]);

int kalman_update(float input, kalman_state_typ* state, float R);

int kalman_predict(kalman_state_typ* state, float F[2][2], float Q[2][2], float alpha);

typedef struct kalman_internal {
	float t;
	float sigma_a;
	float sigma_z;
	float alpha;
	float Q[2][2];
	float R;
	float F[2][2];
} kalman_internal_typ;

BUILD_DLL typedef struct kalman {
	float input;
	float t;
	float sigma_a;
	float sigma_z;
	float alpha;
	kalman_internal_typ internal;
	kalman_state_typ state;
	float output;
	float velocity;
} kalman_typ;

BUILD_DLL int kalman(struct kalman* inst);

typedef struct fit_state {
    float sumx;
    float sumx2;
    float sumy;
    float sumxy;
    unsigned long n;
} fit_state_typ;

BUILD_DLL typedef struct fit {
    float x;
    float y;
    fit_state_typ state;
    float a;
    float b;
} fit_typ;

BUILD_DLL int linearfitinit(struct fit* inst);
BUILD_DLL int linearfitupdate(struct fit* inst);
BUILD_DLL int linearfitfinal(struct fit* inst);

BUILD_DLL int exponentialfitinit(struct fit* inst);
BUILD_DLL int exponentialfitupdate(struct fit* inst);
BUILD_DLL int exponentialfitfinal(struct fit* inst);

#endif
