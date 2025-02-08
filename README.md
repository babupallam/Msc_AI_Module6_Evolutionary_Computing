# MSc AI - Evolutionary Computing (EC) 🚀

## 📌 Overview
This repository contains coursework, exercises, MATLAB implementations, and the **Final Report** for **Evolutionary Computing (EC)** as part of the **MSc Artificial Intelligence program at De Montfort University (DMU).**  
The module explores **Genetic Algorithms (GA), Particle Swarm Optimization (PSO), and Differential Evolution (DE)** for solving **optimization problems** (both constrained and unconstrained).

---

## 📂 Repository Structure

```
MSc_AI_MODULE6_EVOLUTIONARY_COMPUTING/
│── 01_Week 1 Evolutionary Computing/
│   ├── 01_Lecture 01/
│   ├── 02_Lecture 02/
│   ├── 03_Lecture 03/
│   ├── 04_References/
│   ├── 05_Exercises_week_1/
│   ├── README.md
│── 02_Week 2 Evolutionary Computing/
│   ├── 01_Lecture 04/
│   ├── 02_Lecture 05/
│   ├── 03_Lecture 06/
│   ├── 04_EXERCISES WEEK 2/
│   ├── README.md
│── 03_Week 3 Evolutionary Computing/
│   ├── 01_Lecture 07/
│   ├── 04_EXERCISES WEEK 3/
│   ├── README.md
│── 04_FINAL REPORT EC/
│   ├── ARC/
│   │   ├── 01_Uncon_RosenBrock_RGA/
│   │   ├── 02_Uncon_RosenBrock_PSO/
│   │   ├── 03_Uncon_RosenBrock_DE/
│   │   ├── 04_Con_Himmelblau_RGA/
│   │   ├── 05_Con_Himmelblau_PSO/
│   │   ├── 06_Con_Himmelblau_DE/
│   ├── LIVE/
│   ├── FINAL_REPORT_EC_BABUPALLAM_P2849288.pdf
│   ├── README.md
```

---

## 📚 **Coursework Breakdown**

### 📂 **Week 1 - Introduction to Evolutionary Computing**
**Key Topics:**
- Introduction to **Genetic Algorithms (GA)** and Evolutionary Computing.
- Basics of Selection, Crossover, and Mutation.
- **MATLAB implementation of Binary GA**.
- Reference papers on **Evolutionary Computing principles**.
- **Exercises**: Implementing selection and mutation in MATLAB.

### 📂 **Week 2 - Real-Coded Genetic Algorithms (RGA), PSO & DE**
**Key Topics:**
- Introduction to **Real-Coded Genetic Algorithms (RGA)**.
- Implementing **Particle Swarm Optimization (PSO)** in MATLAB.
- Applying **Differential Evolution (DE)** to constrained problems.
- **MATLAB implementations for RGA, PSO, and DE**.
- **Exercises**: Optimization using PSO and DE.

### 📂 **Week 3 - Constraint Handling in Evolutionary Computing**
**Key Topics:**
- Techniques for handling constraints in **Genetic Algorithms, PSO, and DE**.
- Implementing **Penalty Methods, Feasibility Rules, and Hybrid Approaches**.
- **MATLAB implementation of constraint handling**.
- **Exercises**: Optimization of constrained problems in MATLAB.

---

## 📂 **Final Report EC - MSc AI Submission**
The final project submission applies **Genetic Algorithm (GA), Particle Swarm Optimization (PSO), and Differential Evolution (DE)** to **solve benchmark optimization problems**, including:
- **Rosenbrock Function** - Unconstrained Optimization
- **Himmelblau Function** - Constrained Optimization

### **Key Components:**
- **ARC/** - Experimental MATLAB implementations.
- **LIVE/** - Final refined code.
- **FINAL_REPORT_EC_BABUPALLAM_P2849288.pdf** - Complete MSc AI report.

---

## **🔬 Investigations and Observations**
The performance of GA, PSO, and DE is analyzed based on:
- **Benchmark Tests**: Performance evaluation using standard test functions.
- **Parameter Tuning**: Influence of population size, mutation rates, and selection mechanisms.
- **Comparison of Algorithms**: Strengths and weaknesses of each algorithm.

### **Results**
1. **RGA (Real Genetic Algorithm) Performance**
   - Convergence of solutions to optimal values
   - Effectiveness of selection and mutation strategies
2. **PSO Performance**
   - Effect of inertia weight and acceleration coefficients
   - Faster convergence but higher sensitivity to parameter tuning
3. **DE Performance**
   - Impact of mutation and crossover strategies
   - Best performance for constrained problems

---

## **🎯 Key Findings and Future Research**
### **Findings**
- GA is **robust but slower** for convergence.
- PSO provides **fast convergence** but struggles with complex constraints.
- DE exhibits **superior performance** in constrained optimization.

### **Future Research Directions**
- Hybrid algorithms combining GA, PSO, and DE.
- Implementation of adaptive parameter tuning.
- Application to real-world engineering optimization problems.

---

## 🏗 **How to Run the MATLAB Code**

### **Running Genetic Algorithm (GA)**
1. Navigate to the `Week_1_Code` folder.
2. Open MATLAB and run:
   ```matlab
   run('GeneticAlgorithm.m')
   ```

### **Running Particle Swarm Optimization (PSO)**
1. Navigate to the `Week_2_Code` folder.
2. Open MATLAB and run:
   ```matlab
   run('PSO.m')
   ```

### **Running Differential Evolution (DE)**
1. Navigate to the `Week_2_Code` folder.
2. Open MATLAB and run:
   ```matlab
   run('DE.m')
   ```

### **Running Constraint Handling Algorithms**
1. Navigate to `Week_3_Code/ConstraintHandling/`.
2. Open MATLAB and execute:
   ```matlab
   run('ConstraintGA.m')
   ```

---

## 📢 **Final Remarks**
This repository contains all **Evolutionary Computing coursework, MATLAB implementations, and final MSc AI report**. It serves as a **valuable resource for learning and applying GA, PSO, and DE in optimization problems**.

🚀 **Optimizing Solutions with Evolutionary Computing!**  
```